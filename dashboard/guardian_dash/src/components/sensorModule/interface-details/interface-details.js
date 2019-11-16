import React from 'react'
import ReactApexChart from 'react-apexcharts'
import './interface-details.css'

class InterfaceDetails extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      options: {
        chart: {
          toolbar: {
            show: true
          }
        },
        plotOptions: {
          radialBar: {
            startAngle: -135,
            endAngle: 225,
            hollow: {
              margin: 0,
              size: '70%',
              background: '#fff',
              position: 'front',
              dropShadow: {
                enabled: true,
                top: 3,
                left: 0,
                blur: 4,
                opacity: 0.24
              }
            },
            track: {
              background: '#fff',
              strokeWidth: '67%',
              margin: 0, // margin is in pixels
              dropShadow: {
                enabled: true,
                top: -3,
                left: 0,
                blur: 4,
                opacity: 0.35
              }
            },

            dataLabels: {
              name: {
                offsetY: -10,
                show: true,
                color: '#888',
                fontSize: '17px'
              },
              value: {
                formatter: function (val) {
                  return parseInt(val);
                },
                color: '#111',
                fontSize: '36px',
                show: true,
              }
            }
          }
        },
        fill: {
          type: 'gradient',
          gradient: {
            shade: 'dark',
            type: 'horizontal',
            shadeIntensity: 0.5,
            gradientToColors: ['#ABE5A1'],
            inverseColors: true,
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 100]
          }
        },
        stroke: {
          lineCap: 'round'
        },
        labels: ['Current Signal Strength'],
      },
      series: [10],
    }
  }
  render(){
    return(
      <div className='interface-details'>
        <ReactApexChart options={this.state.options} series={this.state.series} type="radialBar" height="350" />
        <h3>Current Connection</h3>
        <p>SSID: public_wifi(1) | BSSID: A9-45-F2-3E-CA-12 | uptime: 72hrs8m</p>
        <div className='interface-details-header'>
          <h2>Wifi Details</h2>
        </div>
        <div className='interface-details-data'>
          <ul>
            <h3>Past Connections</h3>
            <li>
              SSID: Starbucks<br />
              BSSID: 0I-45-F2-7C-9D-12<br />
              uptime: 10m8s
            </li>
            <li>
              SSID: Field_3bs<br />
              BSSID: 59-4A-F2-3E-C4-1K<br />
              uptime: 10hrs8m4s
            </li>
            <li>
              SSID: PrettyFlyForAWifi<br />
              BSSID: A9-45-F2-3E-CA-12<br />
              uptime: 1hr2m4s
            </li>
            <li>
              SSID: SanFrancisco<br />
              BSSID: 9X-45-F2-3E-5D-12<br />
              uptime: 19hrs7m3s
            </li>
          </ul>
        </div>
      </div>
    )
  }
}
export default InterfaceDetails