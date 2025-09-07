\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    r8 f-\solo a c f a
    r g, c e g b,
    r f a c f a,
    r c, e g c e
    g e cis a a, g'
    f a d a d f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    r8 f-\solo a c f a
    r g, c e g b,
    r f a c f a,
    r c, e g c e
    g e cis a a, g'
    f a d a d f
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    f2.^\solo
    e
    f
    c2 c4
    cis4. cis8 cis4
    d2 b4
  }
}

AltoLyrics = \lyricmode {
  Be --
  ne --
  di --
  ctus, qui
  ve -- nit in
  no -- "mi -"
}

Organo = {
  \relative c {
    \clef alto
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f'2.-\solo
    e
    f
    c2 c4
    cis2 cis4
    d2 b4
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  r
  r
  <6>
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
