\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    r2 r4 c'^\solo
    c8[ d16 c] h[ a] g[ f] e4 g8 g
    a8. a16 a8[ h] c4 c8 d
  }
}

SopranoLyrics = \lyricmode {
  Lau --
  da -- _ mus te, be -- ne --
  di -- ci -- mus te, ad -- "o -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r4 e~^\solo
    e8 g f e f a, d4~
    d8 f e d e16[ f e f] g8[ f]
    e4 d c r
    R1
  }
}

AltoLyrics = \lyricmode {
  bo --
  nae vo -- lun -- ta -- tis, bo --
  nae vo -- lun -- ta -- _
  _ _ tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a4.^\solo h8 c c d e
    f4 a, gis2
    r4 a4. c8 h a
    h4. a16[ h] c8 h16[ a] g8 a
    g2 g4 r
    R1
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus
  bo -- _ _ nae vo -- lun --
  ta -- tis, vo -- lun --
  ta -- tis.
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    r2 c8^\solo d e f
    g4 g, c r
    R1
  }
}

BassoLyrics = \lyricmode {
  bo -- nae vo -- lun --
  ta -- _ tis.
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    a4-\solo a'~ a8 g f e
    d e f e16 d e8 h e d
    cis4 a d r
    g g, c8 d e f
    g4 g, c8 d e c
    f e f d a a' g f
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r2 <_+>
  r1
  r
  <6 4>4 <5 3>2.
  r4. <6> <6 4>4
}

\score {
  <<
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
