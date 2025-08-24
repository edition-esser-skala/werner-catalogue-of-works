\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    R1*4
    r8 b' c8.\trill b32 c d16 c b4 d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    R1*4
    r4 f4. b16 a g a b8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r4 r8 d'^\solo c b16 a d8 c16 b
    a8 a b c d[ \tuplet 3/2 8 { es16 d c] } b8[ a]
    g4 r r2
  }
}

SopranoLyrics = \lyricmode {
  et ve -- ri -- tas Do -- mi -- ni
  ma -- net in ae -- ter -- _
  num.
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    b4^\solo c16[ b] c8 d es16 f g8 g
    f f r4 r f8 g
    a a16[ b] c[ a] g[ f] e8 f16 f f8[ \hA e]
    f4 r g8 g16 g g8[ fis]
    g4 r r2
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, su -- per
  nos mi -- se -- ri -- cor -- di -- a e --
  ius, Glo -- ri -- a Pa --
  tri
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r8 b^\solo b es
    es d16[ es] f8 c b4.\trill b8
    a4 r r2
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  lau -- da -- te
  e -- um, o -- mnes po -- pu --
  li.
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r8 b'4^\solo a16 a g8 f16[ e] d8 \hA e
    f4 r r2
    r r4 r8 d
    b' a16 g f8 es d es16 f g8[ f]
  }
}

BassoLyrics = \lyricmode {
  Quo -- ni -- am con -- fir -- ma -- ta
  est
  et
  Fi -- li -- o et Spi -- ri -- tu -- i "San -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b8-\solo b'4 a8 b d, es es,
    b' b'4 a8 g f16 e d8 \hA e
    f d a b c d b c
    f, f'16 es! d8 c b c d d,
    g4 a b16 a g f es8 b'
  }
}

BassFigures = \figuremode {
  r8 <3> <2> r4 <6>4.
  <5 4>8 <\t 3>4 r4. <6>4
  r q <_!> <6 5>8 <_!>
  r4 <6>8 q q4 <6 4>8 <5 _+>
  r4 <6>2.
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
