import { Link } from 'react-router-dom';
import Dashboard from "../components/Dashboard";

export default function Root() {
    return (
        <div className="app-container">
            <div id="sidebar">
                <h1>Webapp</h1>
                <p>Webapp is a web application that is written in TypeScript and uses React.</p>
                <div className="search-container">
                    <form id="search-form" role="search">
                        <input
                            id="q"
                            aria-label="Search"
                            placeholder="Search"
                            type="search"
                            name="q"
                        />
                        <button type="submit">Search</button>
                    </form>
                </div>
                <nav>
                    <ul>
                        <li><a href="/apps/Training/conda/">Home</a></li>
                        <li><Link to="/apps/Training/conda/webapp/dist/about/">About</Link></li>
                    </ul>
                </nav>
            </div>

            <div id="dashboard-container">
                <Dashboard />
            </div>
        </div>
    )
}