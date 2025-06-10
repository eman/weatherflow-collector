# WeatherFlow Collector InfluxDB Data Schema

This document describes the InfluxDB measurements and their data schema as sent by the WeatherFlow collector scripts.

---

## 1. `weatherflow_obs`

**Tags:**
- collector_key (sometimes)
- collector_type
- elevation
- hub_sn
- latitude
- longitude
- public_name
- serial_number (sometimes)
- source
- station_id
- station_name
- timezone

**Fields:**
- time_epoch (ms or s, depending on script)
- device_id (sometimes)
- firmware_revision (sometimes)
- wind_lull
- wind_avg
- wind_gust
- wind_direction
- wind_sample_interval
- wind_sample_count (sometimes)
- wind_avg_min (sometimes)
- wind_gust_min (sometimes)
- wind_direction_min (sometimes)
- wind_lull_min (sometimes)
- wind_sample_interval_min (sometimes)
- wind_avg_10m (sometimes)
- wind_gust_10m (sometimes)
- wind_direction_10m (sometimes)
- wind_lull_10m (sometimes)
- wind_sample_interval_10m (sometimes)
- station_pressure
- barometric_pressure (sometimes)
- air_temperature
- air_temp_high_24h (sometimes)
- air_temp_low_24h (sometimes)
- relative_humidity
- humidity_high_24h (sometimes)
- humidity_low_24h (sometimes)
- illuminance
- brightness (sometimes)
- uv
- solar_radiation
- solar_elevation (sometimes)
- solar_azimuth (sometimes)
- precip_accumulated
- precip_total_1h
- precip_accum_local_yesterday
- precip_analysis_type_yesterday
- precip_accumulation_final (sometimes)
- precip_accumulation_final_local_yesterday (sometimes)
- precip_accumulation_final_local_today (sometimes)
- rain_start_epoch (sometimes)
- rain_intensity (sometimes)
- rain_duration_minutes (sometimes)
- rain_check (sometimes)
- rain_type (sometimes)
- local_daily_rain_accumulation (sometimes)
- pressure_trend (sometimes)
- precipitation_type
- lightning_strike_avg_distance
- lightning_strike_count
- lightning_strike_count_last_1hr
- lightning_strike_count_last_3hr
- lightning_strike_energy (sometimes)
- lightning_strike_time (sometimes)
- strike_last_dist
- strike_last_epoch
- battery
- report_interval
- feels_like
- heat_index
- wind_chill
- dew_point (sometimes)
- dew_point_high_24h (sometimes)
- dew_point_low_24h (sometimes)
- wet_bulb_temperature (sometimes)
- delta_t (sometimes)
- air_density (sometimes)
- pulse_adj_ob_time (remote-socket only)
- pulse_adj_ob_wind_avg (remote-socket only)

---

## 2. `weatherflow_rapid_wind`

**Tags:**
- collector_key
- collector_type
- elevation
- hub_sn
- latitude
- longitude
- public_name
- serial_number
- source
- station_id
- station_name
- timezone

**Fields:**
- time_epoch
- wind_speed
- wind_direction

---

## 3. `weatherflow_hub_status`

**Tags:**
- collector_key
- collector_type
- elevation
- hub_sn
- latitude
- longitude
- public_name
- source
- station_id
- station_name
- timezone

**Fields:**
- time_epoch
- firmware_revision
- rssi
- uptime
- voltage

---

## 4. `weatherflow_evt_precip`

**Tags:**
- collector_key
- collector_type
- elevation
- hub_sn
- latitude
- longitude
- public_name
- serial_number
- source
- station_id
- station_name
- timezone

**Fields:**
- time_epoch

---

## 5. `weatherflow_forecast_daily`

**Tags:**
- collector_type
- elevation
- day_num
- day_relative
- day_start_local
- forecast_day_num
- forecast_month_num
- month_num
- latitude
- longitude
- public_name
- source
- station_id
- station_name
- timezone

**Fields:**
- air_temp_high
- air_temp_low
- conditions
- icon
- precip_probability
- sunrise
- sunset

---

## 6. `weatherflow_forecast_hourly`

**Tags:**
- collector_type
- elevation
- forecast_day_num
- forecast_day_num_padded
- forecast_hour_num
- forecast_hourly_days_out
- latitude
- longitude
- public_name
- source
- station_id
- station_name
- timezone

**Fields:**
- air_temperature
- conditions
- feels_like
- icon
- precip
- precip_icon
- precip_probability
- precip_type
- relative_humidity
- sea_level_pressure
- time
- uv
- wind_avg
- wind_direction
- wind_direction_cardinal
- wind_gust

---

## 7. `weatherflow_system_stats`

**Tags:**
- collector_key
- collector_type
- duration_type (e.g., "import", "forecast_hourly_build", "loki_push", "health_check", "observations", etc.)
- host_hostname
- public_name
- source
- station_id
- station_name
- sysperf_type (for process/netstat metrics)
- sysperf_command (for process utilization metrics)
- netstat_app (for netstat metrics)

**Fields:**
- duration (nanoseconds)
- import_metrics (number of metrics imported, sometimes)
- import_threads (number of threads, sometimes)
- pid, ppid, uptime, utime, stime, cstime, starttime, total_time, seconds, cpu_usage (for process utilization)
- netstat_established, netstat_finwait2, netstat_closewait, netstat_listen, netstat_timewait (for netstat metrics)

---

## 8. `weatherflow_system_events`

**Tags:**
- collector_key
- collector_type
- event (e.g., "process_start")
- host_hostname
- source

**Fields:**
- time_epoch

---

### Notes

- All measurements include a timestamp at the end of the line, typically `${time_epoch}000000000` (nanoseconds).
- Some fields/tags may be omitted if their value is `null` or not available in the current context.
- The actual set of fields/tags may vary slightly depending on the collector type and the specific script.

---