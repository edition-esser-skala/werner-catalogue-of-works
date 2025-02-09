\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    R1*4
    r8 d' g f16 es d8 f f8.\trill g32 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    R1*4
    r8 b' c a f b c f16 es
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    f4^\solo f8 b a c b[ es]
    d c16[ d] es8 d g[ es] c b
    a16[ b c a] f4 f8 f f b16 b
    g8. g16 g4 a8 c f8. es16
    d4 c8.\trill c16 b4 r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um
  o -- mni -- um et in -- vi -- si --
  bi -- _ li -- um.
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    c8^\solo c c f16 f d8. d16 d4
    b8 g es' c16[ b] a8. b16 c8 a'
    f b \grace b a8. a16 b4 r
  }
}

AltoLyrics = \lyricmode {
  Vi -- si -- bi -- li -- um o -- mni -- um
  et in -- vi -- si -- bi -- li -- um, in --
  vi -- si -- bi -- li -- um.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    r4 es8^\solo f b,16[ b'] a[ g] f[ es] d[ c]
  }
}

BassoLyrics = \lyricmode {
  Et in u -- num Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b8-\solo b' a g f es d c
    b a g f << { es' c16 d } \\ { es,4 } >> es'8 g
    f c a f b b' d, b
    es, es' c es f c a f
    b g' es f b, d a f
  }
}

BassFigures = \figuremode {
  r2 r8 <6> q q
  r q q q q4 q8 <3>
  r1
  r
  r4 <6 5>2.
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
