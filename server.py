import http.server
import socketserver
import mimetypes

PORT = 8000

#  MIMETYPES = {
    #  "css": "text/css",
    #  "js": "text/js",
    #  "woff": "application/font-woff",
    #  "woff2": "application/font-woff2",
    #  "ttf": "application/x-font-ttf"
#  }

class MyRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        mimetypes.add_type('application/font-woff2', '.woff2', False)
        try:
            f = open('public/' + self.path, 'rb')
        except IOError:
            f = open('public/index.html', 'rb')


        self.send_response(200)
        self.send_header('Content-type', mimetypes.guess_type(self.path)[0])
        self.end_headers()

        self.wfile.write(f.read())
        f.close()
        return

try:
    Handler = MyRequestHandler

    httpd = socketserver.TCPServer(("", PORT), Handler)

    print("Serving HTTP on 0.0.0.0 port", PORT, "...")
    httpd.serve_forever()

except KeyboardInterrupt:
    print()
    print('Keyboard interrupt received, exiting.')
    httpd.socket.close()
