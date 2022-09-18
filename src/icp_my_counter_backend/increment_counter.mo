import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

// Create a simple Counter actor.
actor Counter {
  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };


  //Type
  public type HttpRequest = {
    url : Text;
    method : Text;
    //body : [Nat8];
    body : Blob;
    headers : [HeaderField];
  };
  public type HttpResponse = {
    //body : [Nat8];
    body : Blob;
    headers : [HeaderField];
    status_code : Nat16;
  };

  type HeaderField = (Text, Text);

  public query func http_request(arg: HttpRequest) : async HttpResponse {
    {
      //body = [Nat8.fromNat(currentValue)];
      body = Text.encodeUtf8(Nat.toText(currentValue));
      headers = [];
      status_code = 200;
    }
  };

}
