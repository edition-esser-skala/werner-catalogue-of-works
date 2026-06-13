\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 6/8 \tempoMarkup "Largo"
    r4-\conSord r8 r4 e8
    a8. h16 a8 a4 e'8
    a,4.\trill r4 a8
    h4 cis8 \appoggiatura e d4.\trill
    cis r4 \gotoBar "18" r8
    R2.
    r4 r8 a'8. e16 cis8 %20
    R2.
    r8 r16 cis' a8 e8. cis16 a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 6/8 \tempoMarkup "Largo"
    r4-\conSord r8 r4 cis8
    e4 d8 e4 gis8
    cis,4. r4 e8
    fis8. gis16 a8 a8. h16 gis8
    a4. r4 \gotoBar "18" r8
    R2.
    r4 r8 e'8. cis16 a8
    R2.
    r8 r16 a' e8 cis8. a16 e8
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key a \major \time 6/8 \tempoMarkup "Largo"
    r4-\conSord r8 r4 a8
    cis4 d8 cis4 e8
    e4. r4 cis8
    h4 e8 fis4 d8
    e4. r4 \gotoBar "18" r8
    R2.*4
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key a \major \time 6/8 \tempoMarkup "Largo" \autoBeamOff
    R2.*4
    r4 r8 r4 \gotoBar "18" e8^\solo
    a8.[ h16] a8 a4 e'8
    a,4. r4 a8
    h4 cis8 \appoggiatura e d4.\trill
    cis r4 cis8
  }
}

SopranoLyricsA = \lyricmode {
  \set stanza = "1. "
  Er --
  bar -- met euch ihr
  Freundt, auch
  ihr Be -- kand --
  te, aufs
}

SopranoLyricsB = \lyricmode {
  \set stanza = "2. "
  Al --
  mo -- ßen rei -- chet
  dar nach
  eur’n Ge -- fal --
  len, Gott
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 6/8 \tempoMarkup "Largo"
    a'8.\p e16 cis8 a4 r8
    a4 h8 cis4 h8
    a8. cis16 e8 a4 cis,8
    d4 cis8 h4 e,8
    a8. cis16 e8 a4 \gotoBar "18" r8
    a4 h8 cis4 cis,8
    fis8. e16 d8 cis4 fis8
    d4 cis8 h4 e,8
    a4. r4 a'8
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <6>4 q8 <7>4 q8
  r2.
  r
  r
  <6>4 q8 <7>4 q8
  r2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
    >>
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "org" "b" }
      \Organo
    }
    \new FiguredBass { \BassFigures }
  >>
}
