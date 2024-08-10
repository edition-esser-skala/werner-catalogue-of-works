\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key h \phrygian \time 4/4 \tempoMarkup "Largo"
    r16 d'\p fis h r ais, cis fis r fis d h d h fis d
    cis8 \tuplet 3/2 8 { fis'16 e fis } cis' ais fis e d h fis d h4
    r16 g''8 h16 e,4 r16 fis8 a16 d,4
    r2 r16 fis, a d r cis e a
    fis4 r r16 a, d fis r fis, cis' fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key h \phrygian \time 4/4 \tempoMarkup "Largo"
    r16 h'\p d fis r cis ais cis r d h fis h fis d' h
    fis' cis' ais fis ais fis cis e d h fis d h4
    r r16 cis'8 e16 a,4 r16 h8 g16
    e4 r r16 d fis a r e cis' e
    a,4 r r16 fis a d r cis ais cis
  }
}

Basso = {
  \relative c {
    \clef bass
    \key h \phrygian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    h'4^\solo fis d8 h r d'
    cis fis, r fis d h r d'
    g,16[ h32 a h16 d,] cis[ e'32 d e16 g,] fis[ a32 g a16 c,] h[ h'32 a h16 d,]
    cis[ a'] fis d a8. a16 d4 r
    d' a fis8 d r4
  }
}

BassoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit in
  no -- _ _ _
  _ mi -- ne Do -- mi -- ni.
  Be -- ne -- di -- ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key h \phrygian \time 4/4 \tempoMarkup "Largo"
    h'4-\solo fis h, h'
    ais fis h, h'
    e, a! d, g
    a8 fis16 d a4 d, a'
    d8 fis cis a d4 ais
  }
}

BassFigures = \figuremode {
  r4 <_+>2.
  r4 <_+>2.
  r4 <_+>2.
  <_+>8 r <4> <_+>4. q4
  r1
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
