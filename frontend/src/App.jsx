import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import './App.css';

function Home() {
  return (
    <div>
      <h1>Welcome to the Analytics Dashboard</h1>
      <p>Click on the links above to view data from the API.</p>
    </div>
  );
}

function Dashboards() {
  const [dashboards, setDashboards] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3000/api/v1/dashboards_controller.rb')
      .then((response) => {
        if (!response.ok) throw new Error('Failed to fetch dashboards');
        return response.json();
      })
      .then((data) => setDashboards(data))
      .catch((error) => setError(error.message));
  }, []);

  return (
    <div>
      <h2>Dashboards</h2>
      {error ? (
        <p style={{ color: 'red' }}>Error: {error}</p>
      ) : (
        <pre>{JSON.stringify(dashboards, null, 2)}</pre>
      )}
    </div>
  );
}

function DataSources() {
  const [dataSources, setDataSources] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3000/api/v1/data_sources_controller.rb')
      .then((response) => {
        if (!response.ok) throw new Error('Failed to fetch data sources');
        return response.json();
      })
      .then((data) => setDataSources(data))
      .catch((error) => setError(error.message));
  }, []);

  return (
    <div>
      <h2>Data Sources</h2>
      {error ? (
        <p style={{ color: 'red' }}>Error: {error}</p>
      ) : (
        <pre>{JSON.stringify(dataSources, null, 2)}</pre>
      )}
    </div>
  );
}

function FetchedData() {
  const [fetchedData, setFetchedData] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3000/api/v1/fetched_data_controller.rb')
      .then((response) => {
        if (!response.ok) throw new Error('Failed to fetch fetched data');
        return response.json();
      })
      .then((data) => setFetchedData(data))
      .catch((error) => setError(error.message));
  }, []);

  return (
    <div>
      <h2>Fetched Data</h2>
      {error ? (
        <p style={{ color: 'red' }}>Error: {error}</p>
      ) : (
        <pre>{JSON.stringify(fetchedData, null, 2)}</pre>
      )}
    </div>
  );
}

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/dashboards">Dashboards</Link>
            </li>
            <li>
              <Link to="/data-sources">Data Sources</Link>
            </li>
            <li>
              <Link to="/fetched-data">Fetched Data</Link>
            </li>
          </ul>
        </nav>

        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/dashboards" element={<Dashboards />} />
          <Route path="/data-sources" element={<DataSources />} />
          <Route path="/fetched-data" element={<FetchedData />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;


// import React, { useState, useEffect } from 'react';
// import './App.css';
// import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

// function App() {
//   const [count, setCount] = useState(0);
//   const [apiData, setApiData] = useState(null);
//   const [error, setError] = useState(null);

//   // Fetch data from the Rails backend
//   useEffect(() => {
//     fetch('http://localhost:3000/api/some_endpoint') // Replace with your actual API endpoint
//       .then((response) => {
//         if (!response.ok) {
//           throw new Error('Failed to fetch data');
//         }
//         return response.json();
//       })
//       .then((data) => setApiData(data))
//       .catch((error) => setError(error.message));
//   }, []);

//   return (
//     <div>
//       <div>
//         <a href="https://vite.dev" target="_blank" rel="noopener noreferrer">
//           <img src="/vite.svg" className="logo" alt="Vite logo" />
//         </a>
//         <a href="https://react.dev" target="_blank" rel="noopener noreferrer">
//           <img src="./assets/react.svg" className="logo react" alt="React logo" />
//         </a>
//       </div>
//       <h1>Vite + React</h1>
//       <div className="card">
//         <button onClick={() => setCount((count) => count + 1)}>
//           count is {count}
//         </button>
//         <p>
//           Edit <code>src/App.jsx</code> and save to test HMR
//         </p>
//       </div>
//       <p className="read-the-docs">
//         Click on the Vite and React logos to learn more
//       </p>

//       <div>
//         <h2>API Data:</h2>
//         {error ? (
//           <p style={{ color: 'red' }}>Error: {error}</p>
//         ) : apiData ? (
//           <pre>{JSON.stringify(apiData, null, 2)}</pre>
//         ) : (
//           <p>Loading data...</p>
//         )}
//       </div>
//     </div>
//   );
// }

// export default App;
