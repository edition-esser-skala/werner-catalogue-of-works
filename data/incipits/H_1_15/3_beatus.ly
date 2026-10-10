\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Andante"
    R1.*4
    r2 r g''~
    g4 e a4. a8 f4 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Andante"
    R1.*5
    c'2. a4 d d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    r4 f^\solo a c f2~
    f4 e8[ d] c4 d b4.\trill b8
    a2 c4. c8 d4 d
    e e f g c, c
    f2. e4 d2
    e4 c2^\tutti a4 d d8 d
  }
}

SopranoLyrics = \lyricmode {
  Be -- a -- tus vir __
  qui ti -- met Do -- mi --
  num: Ge -- ne -- ra -- ti --
  o re -- cto -- _ rum be --
  ne -- di -- ce --
  tur. Et iu -- sti -- ti -- a
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    r2 f4^\solo f f e
    f8[ g] a4 a g f2\trill
    e r r
    r r g4^\tutti g8 g
    g4 e a4. a8 f4 f
  }
}

AltoLyrics = \lyricmode {
  In man -- da -- tis
  e -- ius vo -- let ni --
  mis.
  Glo -- ri -- a
  et di -- vi -- ti -- ae in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*2
    r2 r4 c^\solo h d
    g, c b g a2~
    a8[ h] c4 d c2 h4
    c2 r4 a2^\tutti f4
  }
}

TenoreLyrics = \lyricmode {
  Po -- tens in
  ter -- ra e -- rit se --
  men e -- _ _
  ius: Et "iu -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*2
    r4 f2^\solo e4 d4. d8
    c2 d4 e f4. e8
    d4 c h c g2
    c r r4 d^\tutti
  }
}

BassoLyrics = \lyricmode {
  Ge -- ne -- ra -- ti --
  o re -- _ cto -- _
  rum be -- ne -- di -- ce --
  tur. "iu -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Andante"
    f2.-\solo e4 d c8 b
    a2. b4 g2
    f4 f'2 e4 d2
    c d4 e f4. e8
    d4 c h c g2
    c-\tutti f d
  }
}

BassFigures = \figuremode {
  r1.
  <6>1 <7>4 <6>
  r1 <6!>2
  r <6->1
  r4 <\t> q2 <4>4 <_!>
  r1.
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
