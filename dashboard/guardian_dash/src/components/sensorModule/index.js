import React from 'react';
import './index.css';
import check from '../../assets/images/icons/check-solid.svg'
import times from '../../assets/images/icons/times-solid.svg'
import InterfaceDetails from './interface-details'

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
        // store.subscribe(() => {
        //     this.setState({
        //         payload : store.getState().sensor_state.payload,
        //     })
            
        //     this.state.payload !== null ? this.setState({
        //         UUID : store.getState().sensor_state.uuid,
        //         payload : store.getState().sensor_state.payload,
        //         LTE_connectionStatus : store.getState().sensor_state.payload.LTE_connectionStatus,
        //         NFC_status : store.getState().sensor_state.payload.NFC_status,
        //         HRD_ENC_encryptionStatus : store.getState().sensor_state.payload.HRD_ENC_encryptionStatus,
        //         MDM_profile : store.getState().sensor_state.payload.MDM_profile,
        //         AV_status : store.getState().sensor_state.payload.AV_status,
        //         LTE_provider : store.getState().sensor_state.payload.LTE_provider,
        //         GPS_gpsStatus : store.getState().sensor_state.payload.GPS_gpsStatus
        //     }) : console.error('The websocket did not get the payload');
        //     console.log(store.getState())
        // })
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