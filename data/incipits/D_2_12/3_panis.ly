\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
    c'8 g'4 a16 g a8 d,
    e g,4\p a16 g a8 d,
    e e'16\f f g8 e16 f g8 e \gotoBar "15"
    c,4 r r
    r8 g''4\p a16 g a8 d,
    e g,4\pp a16 g a8 d,
    e4 r r
    R2.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
    c'8 e4 f16 e f8 h,
    c e,4\p f16 e f8 h,
    c c'16\f d e8 c d g,16 a \gotoBar "15"
    c,4 r r
    r8 e'4\p f16 e f8 h,
    c e,4\pp f16 e f8 h,
    c4 r r
    R2.
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*3 \gotoBar "15"
    g'4 c d
    e4. d8 c4
    R2.
    g4 c d
    e4. d8 c4
  }
}

SopranoLyrics = \lyricmode {
  Pa -- nis an --
  ge -- li -- cus,

  pa -- nis an --
  ge -- li -- cus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*3 \gotoBar "15"
    R2.*5
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*3 \gotoBar "15"
    R2.*5
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*3 \gotoBar "15"
    R2.*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "[no tempo]"
    c4 c' f,8 g
    c,4 c'\p f,8 g
    c,4 r8 c'\f h c \gotoBar "15"
    c,4 e h
    c c, f8 g
    c4 c' f,8 g
    c,4 e h
    c g' a
  }
}

BassFigures = \figuremode {
  r2.
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
