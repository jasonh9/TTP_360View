import React from 'react';
import './index.css';

class SensorModule extends React.Component {
    render(){
        return(
            <div className='moduleContainer'>
                <div className='module-header'>
                    <h1>Command Center Dashboard</h1>
                </div>
                <div className='interfaces' >
                    <ul>
                        <li>LTE</li>
                        <li>BLE</li>
                        <li>NFC</li>
                        <li className='active'><span className='arrow-right'/>HDD ENC</li>
                        <li>VPN</li>
                        <li>WIFI</li>
                        <li>GPS</li>
                        <li>AV</li>
                        <li>MDM</li>
                    </ul>
                </div>
                {/* <ul>
                    <li>LTE</li>
                    <li>BLE</li>
                    <li>NFC</li>
                    <li>HDD ENC</li>
                    <li>VPN</li>
                    <li>WIFI</li>
                    <li>GPS</li>
                    <li>AV</li>
                    <li>MDM</li>
                </ul> */ }
            </div>
        )
    }
}

export default SensorModule;