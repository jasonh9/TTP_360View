import React from 'react';
import './index.css';
import store from '../../redux/store/index';
import wifi from '../../assets/wifi-solid.svg';
import ble from '../../assets/bluetooth-brands.svg';
import nfc from '../../assets/nfc.svg';
import hdd from '../../assets/shield-alt-solid.svg';
import vpn from '../../assets/vpn.svg';
import cell from '../../assets/cell.svg';
import gps from '../../assets/gps.svg';
import antiVirus from '../../assets/antivirus.svg';
import mdm from '../../assets/mdm.svg';

class SensorModule extends React.Component {
    constructor() {
        super();
        this.state = {
            UUID : null,
            payload : null,
            LTE_connectionStatus : null,
            names : {
                smokey : "Smokey the Bear",
                david : "David Hasselhoff",
                roger : "Roger The Rabbit"
            }
        }
    }
    componentDidMount() {
        store.subscribe(() => {
            this.setState({
                payload : store.getState().sensor_state.payload,
            })
            
            this.state.payload !== null ? this.setState({
                UUID : store.getState().sensor_state.uuid,
                payload : store.getState().sensor_state.payload,
                LTE_connectionStatus : store.getState().sensor_state.payload.LTE_connectionStatus,
                NFC_status : store.getState().sensor_state.payload.NFC_status,
                HRD_ENC_encryptionStatus : store.getState().sensor_state.payload.HRD_ENC_encryptionStatus,
                MDM_profile : store.getState().sensor_state.payload.MDM_profile,
                AV_status : store.getState().sensor_state.payload.AV_status,
                LTE_provider : store.getState().sensor_state.payload.LTE_provider,
                GPS_gpsStatus : store.getState().sensor_state.payload.GPS_gpsStatus
            }) : console.error('The websocket did not get the payload');
            console.log(store.getState())
        })
    }
    render(){
        const nameDecide = (uuid = this.state.UUID) => {
            if(uuid === '7DAC2C8C-9686-4B42-832A-431F2F99DBE0'){
                return this.state.names.smokey
            }
            if(uuid === '760D34E5-7D73-4B9E-BD1C-625BAC21D813'){
                return this.state.names.david
            }
            if(uuid === '22A60286-6A21-4708-B9E8-EDB5EFDFE9CE'){
                return this.state.names.roger
            }
        }
        return(
            <div className="moduleContainer">
                <h3>{nameDecide()}</h3>
                <ul>
                    <li>
                        <img src={cell} width="40px"/><br/>
                        <h2>LTE</h2>
                        {this.state.LTE_connectionStatus}<br/>
                        {this.state.LTE_provider}
                    </li>
                    <li>
                        <img src={ble} width="40px" /><br/>
                        <h2>BLE:</h2> OFF
                    </li>
                    <li>
                        <img src={nfc} width="40px"/><br/>
                        <h2>NFC</h2>
                        {this.state.NFC_status}
                    </li>
                    <li>
                        <img src={hdd} width="40px"/><br/>
                        <h2>HDD ENC</h2>
                        {this.state.HRD_ENC_encryptionStatus}
                    </li>
                    <li>
                        <img src={vpn} width="40px"/><br/>
                        <h2>VPN</h2>
                        connected
                    </li>
                    <li>
                        <img src={wifi} width="40px"/><br/>
                        <h2>WIFI</h2>
                        connected
                    </li>
                    <li>
                        <img src={gps} width="40px"/><br/>
                        <h2>GPS</h2>
                        {this.state.GPS_gpsStatus}
                    </li>
                    <li>
                        <img src={antiVirus} width="40px"/><br/>
                        <h2>AV</h2>
                        {this.state.AV_status}
                    </li>
                    <li>
                        <img src={mdm} width="40px"/><br/>
                        <h2>MDM</h2>
                        {this.state.MDM_profile}
                    </li>
                </ul>
            </div>
        )
    }
}

export default SensorModule;