\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    r2 e'8 e d h
    r e16 c a8 fis r d'16 h g8 e
    a g f4\trill e16 c e g c8 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    r2 g'8 c h e,
    r c'16 a d8 a r h16 g c8 g
    c,16 f e d c8 d g,16 c8 e16 g f g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    a'4^\solo h c8 d16 e f4~
    f16[ e] d c \appoggiatura c8 h4 a r
    R1*3
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do --
  mi -- no me -- o:
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1
    r2 c8^\solo d16 e f4~
    f16[ d] e[ c] d4\trill c r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  Se -- de a dex --
  tris me -- is,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1
    r8 a4^\solo gis8 a h16 c d8. c16
    h8 c4 h8 c4 r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  Se -- de, se -- de a dex -- tris
  me -- _ _ is,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2
    r8 g'4^\solo g8 e c r h'16 e,
    c'8 a, r a'16 d, h'8 g, r g'16 c,
    f8 g a[ h] c4 r8 c
  }
}

BassoLyrics = \lyricmode {
  do -- nec po -- nam in -- i --
  mi -- cos, in -- i -- mi -- cos, in -- i --
  mi -- cos tu -- os "sca -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    a8-\solo a'4 gis8 a16 g f e d c h a
    gis8 a d e f e d16 c h a
    g8 c g' g, c c' g gis
    a, a' fis d g,! g' e c
    f g a h c c, e c
  }
}

BassFigures = \figuremode {
  r8 <3> <2> r4. <3>8 <\t>
  <6>4 <6 5>8 <_+>2 <\t>8
  <7>4 <4>8 <3>2 r8
  r1
  r8 <6> q2.
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
