export function makeCall(method: string, url: string, cback: (req: XMLHttpRequest) => void) {
    var req = new XMLHttpRequest(); // visible by closure
    req.withCredentials = true;
    req.onreadystatechange = function() {
      cback(req)
    }; // closure
    req.open(method, url);
    req.send();
}