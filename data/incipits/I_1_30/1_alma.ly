\version "2.24.2"
\include "header.ly"

TenoreI = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c4. es8 d g, g f
    es c c'4. h16[ a] h4
    c4 r r8 d d c16 d
    es8 es es d16[ c] d8 g, r4
    r c c8[ b!] b[ as]
  }
}

TenoreILyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  ma -- ter, al -- _ _
  ma, quae per -- vi -- a
  coe -- li por -- ta ma -- nes
  et stel -- la
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1
    c4. es8 d g, g f
    es c c'4. h16[ a] h4
    c4 r r8 d d c16 d
    es8 es es d16[ c] d8 g, r4
  }
}

TenoreIILyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  ma -- ter, al -- _ _
  ma, quae per -- vi -- a
  coe -- li por -- ta ma -- nes
}

TenoreIII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*2
    c4. es8 d g, g f
    es c c'4. h16[ a] h4
    c4 r r8 d d c16 d
  }
}

TenoreIIILyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  ma -- ter, al -- _ _
  ma, quae per -- vi -- a
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c4 c'2 h4
    c8 c, es c g'4. f8
    es4 c g2
    c4 r r g'
    c, c'4. b!8 b as
  }
}

BassFigures = \figuremode {
  r4 <3> <2> r
  r2 <4>4 <_!>
  <6>2 <4>4 <_!>
  r2. <_!>4
  r <3> <2>8 <6>4 q8
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T 1"
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "T 3"
        \new Voice = "TenoreIII" { \dynamicUp \TenoreIII }
      }
      \new Lyrics \lyricsto TenoreIII \TenoreIIILyrics
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
