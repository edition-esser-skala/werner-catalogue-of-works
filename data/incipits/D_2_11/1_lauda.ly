\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Andante"
    d'1
    fis
    e
    a2. a,,4 \gotoBar "26"
    d'  1\p
    fis
    e
    a2. a,,4
    h cis d e
    fis g a cis,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Andante"
    d'1
    fis
    a,
    cis2. a,4 \gotoBar "26"
    d'4 a g fis
    r fis e d
    a'1
    cis2. a,4
    h cis d e
    fis g a cis,
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Andante"
    r4 a' g fis
    r fis e d
    r e d cis
    r cis e a, \gotoBar "26"
    r4 fis' e d
    r d cis h
    r cis h a
    r cis e a,
    h cis d e
    fis g a cis,
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 2/2 \tempoMarkup "Andante" \autoBeamOff
    R1*4 \gotoBar "26"
    d1^\solo
    fis
    e
    a2. a,4
    h cis d e
    fis g a cis,
  }
}

BassoLyrics = \lyricmode {
  Lau --
  da
  Si --
  on Sal --
  _ _ va -- _
  to -- _ rem, _
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Andante"
    r4 fis e d
    r d cis h
    r cis h a
    r a cis a \gotoBar "26"
    r4 fis' e d
    r d cis h
    r cis h a
    r a cis a
    h cis d e
    fis g a cis,
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  r
  r
  r
  r
  r
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
