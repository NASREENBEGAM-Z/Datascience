import matplotlib.pyplot as plt

# Sample data
time = list(range(10))
heart_rate = [75, 78, 80, 82, 85, 90, 95, 100, 105, 110]
body_temp = [36.5, 36.6, 36.7, 36.8, 37.0, 37.2, 37.5, 38.0, 38.5, 39.0]
distance = [50, 52, 54, 56, 58, 60, 65, 70, 75, 80]

# Creating the plot
fig, ax1 = plt.subplots()

# Plotting heart rate and body temperature
ax1.set_xlabel('Time (Minutes)')
ax1.set_ylabel('Heart Rate (BPM) / Body Temperature (°C)', color='tab:blue')
ax1.plot(time, heart_rate, color='tab:red', label='Heart Rate (BPM)')
ax1.plot(time, body_temp, color='tab:blue', label='Body Temperature (°C)')
ax1.tick_params(axis='y', labelcolor='tab:blue')
ax1.legend(loc='upper left')

# Creating a second y-axis for distance
ax2 = ax1.twinx()
ax2.set_ylabel('Distance from Ship (m)', color='tab:green')
ax2.plot(time, distance, color='tab:green', label='Distance from Ship (m)')
ax2.tick_params(axis='y', labelcolor='tab:green')

# Title and display
plt.title('NAVYGUARD PRO Sample Data Visualization')
plt.show()