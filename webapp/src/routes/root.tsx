export default function Root() {
    return (
        <>
            <div id="sidbar">
                <h1>Webapp</h1>
                <p>Webapp is a web application that is written in TypeScript and uses React.</p>
                <div>

                    <form id="search-form" role="search">
                        <label htmlFor="search">Search</label>
                        <input
                            id="q"
                            aria-label="Search"
                            placeholder="Search"
                            type="search"
                            name="q"
                        />
                        <div
                            id="search-spinner"
                            aria-hidden
                            hidden={true}
                        />
                        <div
                            className="sr-only"
                            aria-live="polite"
                        ></div>
                    </form>
                    <form method="post">
                        <button type="submit">Search</button>
                    </form>
                </div>
                <nav>
                    <ul>
                        <li><a href="/apps/Training/conda/webapp/dist">Home</a></li>
                        <li><a href="/apps/Training/conda/webapp/dist/about">About</a></li>
                    </ul>
                </nav>
            </div>
            <div id="details"></div>
        </>
    )
}