from flask import Flask, jsonify
from datetime import datetime, timezone
import logging
import os

app = Flask(__name__)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

@app.route('/', methods=['GET'])
def get_current_time():
     # return current UTC time in JSON format
    try:
        # Use timezone-aware UTC time
        current_time = datetime.now(timezone.utc)
        response = {
            "status": "success",
            "timestamp": current_time.isoformat(),
            "timezone": "UTC",
            "formatted_time": current_time.strftime("%Y-%m-%d %H:%M:%S"),
            "unix_timestamp": int(current_time.timestamp())
        }
        logger.info(f"Time request served: {current_time}")
        return jsonify(response), 200
    
    except Exception as e:
        logger.error(f"Error processing request: {str(e)}")
        error_response = {
            "status": "error",
            "message": "Failed to retrieve current time",
            "code": 500
        }
        return jsonify(error_response), 500

@app.route('/health', methods=['GET'])
def health_check():
     # k8s liveness probe
    try:
        return jsonify({"status": "healthy"}), 200
    except Exception as e:
        logger.error(f"Health check failed: {str(e)}")
        return jsonify({"status": "unhealthy"}), 503

@app.errorhandler(404)
def not_found(error):
     # Handle 404 errors with consistent format
    return jsonify({
        "status": "error",
        "message": "Endpoint not found",
        "code": 404
    }), 404

@app.errorhandler(500)
def internal_error(error):
     # Handle 505 errors with consistent format
    logger.error(f"Internal server error: {str(error)}")
    return jsonify({
        "status": "error",
        "message": "Internal server error",
        "code": 500
    }), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    debug_mode = os.environ.get('DEBUG', 'False').lower() == 'true'
    
    logger.info(f"Starting Flask application on port {port} (debug={debug_mode})")
    app.run(host='0.0.0.0', port=port, debug=debug_mode)