# -----------------------------------------------------------------------------
# 
# Spherical geography feature classes
# 
# -----------------------------------------------------------------------------
# Copyright 2010 Daniel Azuma
# 
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the copyright holder, nor the names of any other
#   contributors to this software, may be used to endorse or promote products
#   derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# -----------------------------------------------------------------------------
;


module RGeo
  
  module Geography
    
    module SimpleSpherical
      
      
      class PointImpl
        
        
        include Features::Point
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicPointMethods
        
        
        def _validate_geometry
          @x = @x % 360.0
          @x -= 360.0 if @x >= 180.0
          @y = 90.0 if @y > 90.0
          @y = -90.0 if @y < -90.0
          super
        end
        
        
        def _xyz
          @xyz ||= PointXYZ.from_latlon(@y, @x)
        end
        
        
        def distance(rhs_)
          rhs_ = Features.cast(rhs_, @factory)
          case rhs_
          when PointImpl
            _xyz.dist_to_point(rhs_._xyz) * SimpleSpherical::RADIUS
          else
            super
          end
        end
        
        
      end
      
      
      class LineStringImpl
        
        
        include Features::LineString
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicLineStringMethods
        include SimpleSpherical::LineStringMethods
        
        
      end
      
      
      class LineImpl
        
        
        include Features::Line
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicLineStringMethods
        include SimpleSpherical::LineStringMethods
        include ImplHelpers::BasicLineMethods
        
        
      end
      
      
      class LinearRingImpl
        
        
        include Features::Line
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicLineStringMethods
        include SimpleSpherical::LineStringMethods
        include ImplHelpers::BasicLinearRingMethods
        
        
      end
      
      
      class PolygonImpl
        
        
        include Features::Polygon
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicPolygonMethods
        
        
      end
      
      
      class GeometryCollectionImpl
        
        
        include Features::GeometryCollection
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicGeometryCollectionMethods
        
        
      end
      
      
      class MultiPointImpl
        
        
        include Features::GeometryCollection
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicGeometryCollectionMethods
        include ImplHelpers::BasicMultiPointMethods
        
        
      end
      
      
      class MultiLineStringImpl
        
        
        include Features::GeometryCollection
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicGeometryCollectionMethods
        include ImplHelpers::BasicMultiLineStringMethods
        
        
      end
      
      
      class MultiPolygonImpl
        
        
        include Features::GeometryCollection
        include ImplHelpers::BasicGeometryMethods
        include SimpleSpherical::GeometryMethods
        include ImplHelpers::BasicGeometryCollectionMethods
        include ImplHelpers::BasicMultiPolygonMethods
        
        
      end
      
      
    end
    
  end
  
end