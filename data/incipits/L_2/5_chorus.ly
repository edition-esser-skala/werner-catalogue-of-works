\version "2.24.2"
\include "header.ly"

TenoreI = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo giusto"
    h4. h8 h4 a h2
    r r r4 h8[ c]
    d4. g,8 g4 a h2
    R1.
    h4. h8 h4 d h a
  }
}

TenoreILyrics = \lyricmode {
  Än -- mahl äns iſt äns
  ä
  Nul -- la daß iſt käns

  zwä -- mahl "2" iſt vie -- ri
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo giusto"
    R1.
    g4. g8 g4 fis g2
    r r r4 g8[ a]
    h4. h8 h4 fis g2
    R1.
  }
}

TenoreIILyrics = \lyricmode {
  Än -- mahl äns iſt äns
  ä
  Nul -- la daß iſt käns
}

TenoreIII = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo giusto"
    R1.
    h4. h8 h4 a h2
    r r r4 h8[ c]
    d4. g,8 g4 a h2
    R1.
  }
}

TenoreIIILyrics = \lyricmode {
  Än -- mahl äns iſt äns
  ä
  Nul -- la daß iſt käns
}

BassoIeII = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo giusto"
    R1.
    g'4. g8 g4 d g2
    r r r4 g
    g4. g8 g4 d g2
    R1.
  }
}

BassoIeIILyrics = \lyricmode {
  Än -- mahl äns iſt äns
  ä
  Nul -- la daß iſt käns
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Tempo giusto"
    g'2. d4 g8 d h d
    g,2. d'4 g2
    g,2. d'4 g2
    g,2. d'4 g8 d h d
    g,2 g'4 fis g d
  }
}

BassFigures = \figuremode {
  r1 r8 <\t>4.
  r1.
  r
  r1 r8 <\t>4.
  r1.
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
