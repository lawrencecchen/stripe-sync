type Role = "admin" | "user";
interface User {
  name: string;
  role: Role;
}
type UserButAType = { name: string; role: Role; id: number; age: number };
