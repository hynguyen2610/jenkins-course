#!/usr/bin/env python3

from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

class RequestHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        if self.path == "/trigger-jenkins":
            # Run the local script
            result = subprocess.run(['/data/gitea/home/trigger-jenkins.sh'], capture_output=True, text=True)
            
            # Log the result for debugging
            print(result.stdout)
            print(result.stderr)
            
            # Send response
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(b"Script executed.")
        else:
            self.send_response(404)
            self.end_headers()

def run(server_class=HTTPServer, handler_class=RequestHandler, port=8081):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting httpd on port {port}...')
    httpd.serve_forever()

if __name__ == "__main__":
    run()
