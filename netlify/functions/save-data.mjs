// TODO: Update this function when connecting Supabase.
// Currently the frontend uses localStorage directly.
// When Supabase is added:
//   1. Validate the Supabase JWT from Authorization header
//   2. Upsert data into Supabase for the user
//   3. Return { ok: true }

export default async (req) => {
  return new Response(JSON.stringify({ error: "Not implemented — using localStorage" }), {
    status: 501,
    headers: { "Content-Type": "application/json" }
  });
};

export const config = { path: "/api/save-data" };
