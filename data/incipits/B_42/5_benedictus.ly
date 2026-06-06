\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Andante"
    R2.
    dis'8 fis16 e \hA dis( cis) \hA dis8 r4
    h16( a) h( c) d8 c h a
    h16( a) h8 r d4 h8
    g16( fis) g8 r e'4 c8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Andante"
    R2.
    h'8 dis fis,16( e) fis8 r4
    g16( fis) g( a) h8 a g fis
    g16( fis) g8 r4 r8 g~
    g e c16( h) c8 r a'
  }
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    e8[^\solo g16 fis] e8[ dis] e[ c']
    h4 h, e8[ fis]
    g4. fis16[ e] d8.[ c16]
    h8.[ a16] g4 h'
    e, c'4. a8
  }
}

BassoLyrics = \lyricmode {
  Be -- _ ne --
  di -- ctus, qui
  ve -- _ _
  _ nit in
  no -- _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Andante"
    e4.-\solo fis8 g a
    h4 h,8 a' g fis
    e d!16 c h8 c d4
    g, h g
    c a c
  }
}

BassFigures = \figuremode {
  r4. <6\\>8 <6>4
  <_+>4. <\t>
  r2 <6 4>8 <5 _+>
  r2.
  r2 <6>4
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
