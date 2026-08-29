\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g''16 d g h a d, a' d h4 r
    g,16 d g h a d, a' d h4 r
    r16 g h d g8 h, r16 a cis e a8 \hA cis,
    r16 h d fis h8 d, cis d e, \hA cis'
    d16 a d fis h, h' g e cis a d fis, e8 \hA cis'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r2 g''16 d g h a d, a' d
    h4 r g,16 d g h a d, a' d
    h4 r16 e, g h cis8 e, r16 fis a \hA cis
    d8 fis, r16 g h d cis8 d e, \hA cis'
    d16 a d fis h, h' g e cis a d fis, e8 \hA cis'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4^\tutti d r8 d d d
    d4 d r8 d d d
    d[ h] e4. cis8 fis4~
    fis8[ d] g4. fis8 e4
    fis r r2
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ _ _
  li et ter --
  rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti a r8 g a fis
    g4 a r8 g a fis
    g4. e8 a4. fis8
    h4. g8 a a a4
    a r r2
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ _ _
  _ _ li et ter --
  rae,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    h4^\tutti a r8 h a a
    h4 a r8 h a a
    h4 g8[ h] cis4 a8[ \hA cis]
    d4 h8 d cis d4 \hA cis8
    d4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ _ _
  _ li et ter -- _ _
  rae,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti d r8 g fis d
    g4 d r8 g fis d
    g4 e8[ g] a4 fis8[ a]
    h4 g8 h a[ d,] a4
    d r r2
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ _ _
  _ li et ter -- _
  rae,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g8-\tutti g' fis d g, g' fis d
    g, g' fis d g, g' fis d
    g, g' e g a, a' fis a
    h, h' g h a d, a' a,
    d fis g e a fis g a
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <_+>
  r <7 _+>4 <4>8 <_+>
  r2 <_+>4 <6 5>8 <_+>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
