\version "2.24.2"
\include "header.ly"

TenoreI = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2
    r2 r4 d
    fis8 d g4 r8 e f f
    r d e e r c d d
    r h c c4 h8 a4
  }
}

TenoreILyrics = \lyricmode {
  C
  a s cas t i ti
  t i ti r i ri
  t i ri cas ti
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r4 g h8 g c4
    r8 a h h r g a a
    fis g g[ fis] g4 r
    a d8 h g4 c8 a
    g4 r8 h c c r a
    h h r g a g4 fis8
  }
}

TenoreIILyrics = \lyricmode {
  C a s cas
  t i ti r i ri
  ti ri ti ri
  C a s cas a s
  cas t i ti r
  i ri r i ri ti
}

TenoreIII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2
    r2 g4 h8 g
    d'4 r8 h e c a c
    d h g4 r8 a f f
    r g e e r g d' a
  }
}

TenoreIIILyrics = \lyricmode {
  C a s
  cas c a s cas c
  a s cas t i ti
  cas ti ri b o m
}

BassoIeII = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c4 e8 c g'4 r8 e
    f f r d e e r c
    d h c[ d] g,4 r
    d' h8 g c4 r8 a
    h h r g' a a r f
    g g r e fis g d4
  }
}

BassoIeIILyrics = \lyricmode {
  C a s cas t
  i ti r i ri r
  i ri ti -- ri
  c a s cas t
  i ti r i ri t
  i ti r i ri ti
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c4 e8 c g'4 r8 e
    f f r d e e r c
    d h c d g,4 g'
    d h8 g c4 r8 a
    h h r g' a a r f
    g g r e fis g d4
  }
}

BassFigures = \figuremode {
  r1
  r4. <6>2 r8
  <_+> r <6 5> <_+> r2
  <_+>2.. <6>8
  <6>4. q2 q8
  r4. q8 <6 5>4 <4>8 <_+>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Schullmeiſter"
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "Schwabnwürth"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "Schnepfendrekh"
        \new Voice = "TenoreIII" { \dynamicUp \TenoreIII }
      }
      \new Lyrics \lyricsto TenoreIII \TenoreIIILyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "Mazko" "Barthlme" }
        \new Voice = "BassoIeII" { \dynamicUp \BassoIeII }
      }
      \new Lyrics \lyricsto BassoIeII \BassoIeIILyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { indent = 2\cm }
}
