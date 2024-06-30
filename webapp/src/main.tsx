import * as React from "react";
import * as ReactDOM from "react-dom/client";
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import ErrorPage from "./error-page";
import "./index.css";
import Root from "./routes/root";

const router = createBrowserRouter([
  {
    path: "/apps/Training/conda/webapp/dist",
    element: <Root />,
    errorElement: <ErrorPage />,
  },
]);

const root = document.getElementById("root")

if(root)
ReactDOM.createRoot(root).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);