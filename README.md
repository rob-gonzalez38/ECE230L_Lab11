# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Rob Gonzalez
Orlando Godina

## Summary
In this lab, we learned how to divide a clock signal using ripple counters and modulo counters. The ripple counter used T flip-flops to divide the clock by powers of two, while the modulo counter used full adders and D flip-flops to count to a set value and reset. This showed how different designs can achieve clock division in hardware. Overall, the lab helped reinforce how sequential logic and flip-flops work together in real digital systems.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The modulo counter is designed to toggle the output each time the desired count is reached, so it takes two full counting sequences to complete one single clock cycle.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ring counter's output goes to all 1s on the first clock cycle because the flip flops may be negative edge triggered and the clock signal may start with a high to low transition and could trigger multiple stages. Another reason could be that the LED outputs can appear to be solidly on because the transitions are very quick to perceive, yet the signalds are toggling if the input clock is 100MHz.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
To get an output of 1KHz, I would use a width of 17 bits of ring counter.
