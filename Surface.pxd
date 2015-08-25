cimport Grid
cimport ReferenceState
cimport PrognosticVariables
cimport DiagnosticVariables
cimport ParallelMPI
cimport TimeStepping
from Thermodynamics cimport ClausiusClapeyron


cdef class Surface:
    cdef:
        object scheme

    cpdef initialize(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref)

    cpdef update(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref, PrognosticVariables.PrognosticVariables PV,DiagnosticVariables.DiagnosticVariables DV, ParallelMPI.ParallelMPI Pa, TimeStepping.TimeStepping TS)

cdef class SurfaceNone:
    cpdef initialize(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref)

    cpdef update(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref, PrognosticVariables.PrognosticVariables PV,DiagnosticVariables.DiagnosticVariables DV, ParallelMPI.ParallelMPI Pa, TimeStepping.TimeStepping TS)

cdef class SurfaceSullivanPatton:
    cdef:
        double theta_flux
        double z0
        double gustiness
        double buoyancy_flux
        double [:] ustar
        double [:] windspeed
        double [:] u_flux
        double [:] v_flux
    cpdef initialize(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref)

    cpdef update(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref, PrognosticVariables.PrognosticVariables PV,DiagnosticVariables.DiagnosticVariables DV, ParallelMPI.ParallelMPI Pa, TimeStepping.TimeStepping TS)

cdef class SurfaceBomex:
    cdef:
        double theta_flux
        double qt_flux
        double ustar
        double gustiness
        double [:] windspeed
        double [:] u_flux
        double [:] v_flux
    cpdef initialize(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref)

    cpdef update(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref, PrognosticVariables.PrognosticVariables PV,DiagnosticVariables.DiagnosticVariables DV, ParallelMPI.ParallelMPI Pa, TimeStepping.TimeStepping TS)


cdef class SurfaceGabls:
    cdef:
        double gustiness
        double z0
        double (*L_fp)(double T, double Lambda) nogil
        double (*Lambda_fp)(double T) nogil
        ClausiusClapeyron CC
        double [:] windspeed
        double [:] ustar
        double [:] u_flux
        double [:] v_flux
        double [:] qt_flux
        double [:] s_flux


    cpdef initialize(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref)

    cpdef update(self, Grid.Grid Gr, ReferenceState.ReferenceState Ref, PrognosticVariables.PrognosticVariables PV,DiagnosticVariables.DiagnosticVariables DV, ParallelMPI.ParallelMPI Pa, TimeStepping.TimeStepping TS)




cdef inline double compute_z0(double z1, double windspeed) nogil

