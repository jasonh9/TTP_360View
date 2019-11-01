import React from 'react';
import SideNav from './components/sideNav';
import SensorModule from './components/sensorModule';

import './App.css';

function App() {
  return (
    <div className="App">
        <SideNav />
        <SensorModule />
    </div>
  );
}

export default App;
