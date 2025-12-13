\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante moderato"
    R1*2
    d'4.\f e16( cis) d4. e16( cis) \gotoBar "9"
    g'4 r r2
    R1*2
    d4.\f \tuplet 3/2 8 { fis16 e d } h8 \tuplet 3/2 8 { g'16 fis e } \appoggiatura d8 cis8. e16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante moderato"
    g'4.\f a16( fis) g4. a16( fis)
    g8 \tuplet 3/2 8 { a16 h c } h8 a16( h) c8 h e g,
    fis16( g) g( a) a8 h16( a) a8 g fis h16( a) \gotoBar "9"
    g'4 r r2
    R1*2
    r8 fis,16\f g a8 d4 e cis8
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Andante moderato" \autoBeamOff
    R1*3 \gotoBar "9"
    g4. a16[ fis] g8 c h e
    d h16[ a] g8 \tuplet 3/2 8 { a16[ h c] } h8 a16[ h] c8 h
    e d c d16[ e] d[ a] h[ g] fis8 g\trill
    a4 r r2
  }
}

TenoreLyrics = \lyricmode {
  O Ma -- ri -- a hilff mir käm -- pfen
  und die bö -- ße Ney -- gung däm -- pfen,
  lei -- the mich mit dei -- ner Gnad.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante moderato"
    g'8 a h c h e d c
    h a g fis e d c e
    d e fis g fis h a g \gotoBar "9"
    g, a h c h e d c
    h g' e fis g fis e d
    c h a g fis g d' e
    fis d16 e fis8 d g e a g
  }
}

BassFigures = \figuremode {
  r4 <6>8 q q q q q
  q <6\\>4. <6>8 q q <3>
  r4 <6>8 q q q <6\\> <6>
  r4. <6>8 r <6> q q
  q2. q8 q
  r4. q8 q2
  r2. <_+>4
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
    \new ChoirStaff  <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
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
