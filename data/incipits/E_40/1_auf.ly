\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario"
    R1*2
    r8 c'16(\f f) a( f) b( g) a8 r a,16( f) b( g)
    a( c) d( f) e( c) f( c) g'8 a b16( g) e( c)
    a'( f) d( b) a( f) g( e) f4 r
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario"
    R1*2
    r8 a'16(\f c) f( a) g( e) f8 r f,16( a) g( e)
    f8. d'16 c4~ c8. f16 d( b) g( e')
    c( a) f( d') c( a) b( g) a8 f r4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r2 r8 f16(\p b) d( f) es( g)
    f8 d16( c) b4 r2
    f'8\f c16( a) f8 r c'16( a) d( b) c8 r
    c16( a) d( f) e( c) f( c) g'( c,) a'( c,) b'( g) e( c)
    a'( f) d( b) a( f) g( e) f4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r2 r8 d16(\p f) b( d) a8
    b f16( es) d4 r2
    f'8\f c16( a) f8 r a16( f) b( g) a8 r
    a16( f) b( d) c4~ c8. f16 d( b) g( e')
    c( a) f( d') c( a) b( g) a8 f r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    r4 r8 f^\solo b f d' es
    f d16[ c] b8 d16[ es] f8 c16[ a] f8 d'
    c16[ a] f8 r4 r2
    R1
    r2 r4 r8 f
  }
}

SopranoLyrics = \lyricmode {
   Auf, auf, ihr Hir -- ten 
   all -- zu -- gleich, bringt Flö -- ten und Schall -- 
   mey -- en, 
   
   und
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1*5
  }
}

AltoLyrics = \lyricmode {
   %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1*5
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Tempo ordinario"
    b8\p b' f d b4. c8
    d4. b8 a4. b8
    f\f f'4 c8 f4. c8
    f, b, c a' e f g c
    f b, c c, f a'16 g f8 es!
  }
}

BassFigures = \figuremode {
  r4 <\t> r4. <6>8
  q1
  r4. <_!>8 <3> <6 4> <5 3> <_!>
  r4 q8 <6>2 <_!>8
  r4 <6 4>8 <5 _!>2 <\t>8
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "ob"
        \new Staff {
          \set Staff.instrumentName = "1"
          \OboeI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \OboeII
        }
      >>
    >>
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
