\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
    a'2^\solo b
    a g
    f e
    d r
    f g
    a b
  }
}

SopranoLyrics = \lyricmode {
  Be -- _
  ne -- _
  di -- _
  ctus,
  qui __ _
  ve \hy
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
    a'2^\solo b
    a g
    f e
    d r
    f g
    a b
  }
}

AltoLyrics = \lyricmode {
  Be -- _
  ne -- _
  di -- _
  ctus,
  qui __ _
  ve \hy
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key d \minor \time 2/2 \tempoMarkup "Allabreve"
    d4-\solo f g e
    cis a h \hA cis
    d f g a
    b! g a a,
    d f e c!
    f d g e
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <6 5>4 <_+>
  r1
  r
  r
}

\score {
  <<
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
