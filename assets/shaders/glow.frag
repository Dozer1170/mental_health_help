#version 460 core

#include <flutter/runtime_effect.glsl>

uniform float u_time;
uniform vec2 u_resolution;

out vec4 fragColor;

float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec2 uv = FlutterFragCoord().xy / u_resolution.xy;
    vec2 center = vec2(0.5, 0.5); // Center of the screen
    float radius = 0.5; // Radius of the glow

    // Calculate distance from center
    float dist = distance(uv, center);
    
    // Soften the distance to create a glow effect
    float glow = smoothstep(radius, radius + 0.05, radius - dist);

    // Add some noise to the glow
    float noise = rand(uv * 10.0 + u_time) * 0.2;
    glow += noise;

    // Output final color
    vec3 color = vec3(0.1, 0.8, 1.0); // Light blue color
    fragColor = vec4(color * glow, 1.0);
}
