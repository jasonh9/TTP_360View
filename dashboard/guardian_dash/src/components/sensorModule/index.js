import React from 'react';
import './index.css';
import check from '../../assets/images/icons/check-solid.svg'
import times from '../../assets/images/icons/times-solid.svg'

import InterfaceDetails from './interface-details'

class SensorModule extends React.Component {
    render(){
        return(
            <div className='moduleContainer'>
                <div className='module-header'>
                    <h1>John Smith's Dashboard Details</h1>
                </div>
                <div className='interfaces' >
                    <div className='interface-selection'>
                        <ul>
                            <li>LTE<img className='check' src={check} /></li>
                            <li>BLE<img className='check' src={check} /></li>
                            <li>NFC<img className='check' src={check} /></li>
                            <li>HDD ENC<img className='check' src={check} /></li>
                            <li>VPN<img className='check' src={check} /></li>
                            <li className='active'><span className='arrow-right'/>WIFI<img className='times' src={times} /></li>
                            <li>GPS<img className='check' src={check} /></li>
                            <li>AV<img className='check' src={check} /></li>
                            <li>MDM<img className='check' src={check} /></li>
                        </ul>
                    </div>
                    <InterfaceDetails />
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