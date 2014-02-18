# Global descriptors of brain electrical activity

`globalDescriptors.m`: the implementation, including a comment on usage

`wolf.data`: a test data set (2 sec, 128 samples/sec, 21 channels)

***

Test run with window size 128 samples, step size 128 samples and 32 samples:

```
>> help globalDescriptors
  compute global descriptors of EEG over a running window

  gd = globalDescriptors(x, fSamp, N)
  gd = globalDescriptors(x, fSamp, N, step)

  x:        data set (samples x channels)
  fSamp:    sampling frequency of the data
  N:        window size
  step:     step size, default = N

  gd:       global descriptors (samples x [Sigma, Phi, Omega])
>> load wolf.data
>> gd = globalDescriptors(wolf, 128, 128)

gd =

          13.0956845194698          11.7792213798178          2.85878318691249
          12.5536843261832          12.1529487415706          3.23859051965593

>> gd = globalDescriptors(wolf, 128, 128, 32)

gd =

          13.0956845194698          11.7792213798178          2.85878318691249
          13.2247103377395          11.7085290888065            2.983216508628
          13.2258904456649          11.6568634752435          3.16669742861739
          12.6761651000011          11.9714922729906          3.17961786915619
          12.5536843261832          12.1529487415706          3.23859051965593
```

***

The system of global descriptors was introduced by

>   J. Wackermann (1999), Towards a quantitative characterisation of functional
    states of the brain: From the non-linear methodology to the global linear
    description. International Journal of Psychophysiology 34: 65–80

and recently comprehensively described by

>   J. Wackermann and C. Allefeld (2009). State space representation and global
    descriptors of brain electrical activity. In C. M. Michel et al., editors,
    Electrical Neuroimaging: A Systematic Introduction, pages 191-214. Cambridge
    University Press, 2009

Please direct questions regarding the methodology to J. Wackermann and questions regarding the implementation to C. Allefeld.
