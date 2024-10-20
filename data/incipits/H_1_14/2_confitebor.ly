\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    g''8 h d c h4 a g d
    h8 c d c h4 a g a
    h8 c d c h4 d2 g4
    fis8 g a g fis g e fis d e c d
    h c d c h c a h g d' c d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    g''4 h8 a g4 fis g fis
    g h,8 a g4 fis g fis
    g a g fis g8 a h g
    a4 a'8 g fis g e fis d e c d
    h c d c h c a h g d' c d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    d'4.^\tutti d8 d4 d d d
    d4. d8 d4 d d d
    d d d1
    d2 a d
    d2. d4 d d
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de me --
  o, in con --
  si -- li -- o "iu -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti g8 g4 fis g fis
    g4. g8 g4 fis g fis
    g a g fis g2
    fis fis a
    g2. fis4 g g
  }
}

AltoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de me -- _ _
  o, in con --
  si -- li -- o "iu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    h4.^\tutti h8 h4 a g a
    h4. h8 h4 a g a
    h a h a h2
    a2 d a
    h2. a4 g h
  }
}

TenoreLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de me -- _ _
  o, in con --
  si -- li -- o "iu -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti g8 g4 d h d
    g4. g8 g4 d h d
    g fis g d h g
    d'2 d fis
    g2. d4 h g
  }
}

BassoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de me -- _ _ _
  o, in con --
  si -- li -- o "iu -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    g'2.-\tutti d4 h d
    g2. d4 h d
    g fis g d h g
    d2 d' fis
    g2. d4 h g
  }
}

BassFigures = \figuremode {
  r1.
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
