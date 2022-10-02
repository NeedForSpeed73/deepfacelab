#!/bin/bash

function val_from_python {
        pythonval="$(python3 - <<END
import tensorflow as tf
print('Num GPUs Available: ', len(tf.config.list_physical_devices('GPU')))

END
)"

        printf %"s\n" "$pythonval"
}
val_from_python
