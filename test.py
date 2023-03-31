
"""
export type Operation<Response = ObjectLiteral, Metadata = ObjectLiteral> = {
  name: string;
  metadata: Metadata;
  done: boolean;
  error?: Status; // Tricky to work with, but can be replaced here (e.g. `TestOperationError`)
  response?: Response;
};
"""
