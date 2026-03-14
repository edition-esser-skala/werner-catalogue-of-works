\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r4 r8 g'-\tutti c g e' c
    g'4 g,8 h c d e8. e16
    d8 d e4. cis8 d4~
    d8 h c4. h8 a4
    h8 \mvTr d\f-\solo e h r cis d a
    r h c4. h8 a d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r4 r8 g'-\tutti c g e' c
    g' h, d16 c d8 g, h g c
    h4 r8 h c a r a
    h g r g a g4 fis8
    g4 r8 \mvTr g\f-\solo e g r a
    h fis r g a g4 fis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r4 r8 g'^\tutti c g e' c
    g'4 g,8 h c d e8. e16
    d8 d e4. cis8 d4~
    d8 h c4. h8 a4
    h r r2
    r r4 r8 d
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na sal -- ve,
  ma -- ter mi -- se -- ri -- cor -- di --
  ae, vi -- ta, dul -- ce --
  do, sal -- ve, sal --
  ve.
  Ad
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1
    r8 d^\tutti h d e g g8. g16
    g4 r8 e e4 r8 a
    d,4 r8 g a g4 fis8
    g4 r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  Ma -- ter mi -- se -- ri -- cor -- di --
  ae, et spes, et
  spes no -- stra, sal -- _
  ve.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1
    r8 h^\tutti d h g h c8. c16
    h4 r8 h c a r a
    h g r e' d d d4
    d r r2
    R1
  }
}

TenoreLyrics = \lyricmode {
  Ma -- ter mi -- se -- ri -- cor -- di --
  ae, dul -- ce -- do, dul --
  ce -- do, spes no -- stra, sal --
  ve.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1
    r8 g'^\tutti h g c g e c
    g'4 r8 gis a4 r8 fis
    g4 r8 e fis g d4
    g, r r2
    R1
  }
}

BassoLyrics = \lyricmode {
  Ma -- ter mi -- se -- ri -- cor -- di --
  ae, et spes, et
  spes, spes no -- stra, sal --
  ve.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti c' g e c4 r
    r8 g' h g c g e c
    g'4 r8 gis a4 r8 fis
    g4 r8 e fis g d4
    g, r8 g'-\solo a e r fis
    g d r e fis g d4
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <_!>8 <_+>4.
  r4. <6>8 <6 5>4 <4>8 <_+>
  r4. <6>8 <_!> <6\\>4 <6>8
  r <6>4 r8 <6 5>4 <4>8 <_+>
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
