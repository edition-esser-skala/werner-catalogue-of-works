\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    r8 b'16 b d d f f b b d d
    c c a a f f c c a a f' f \gotoBar "10"
    b,4 r r
    r8 f'16 f d d b b f f d d
    b4 r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    r8 b'16 b d d f f b b d d
    c c a a f f c c a a f' f \gotoBar "10"
    b,4 r r
    r8 f'16 f d d b b f f d d
    b4 r r
  }
}

ViolaI = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    f4 r f
    a c a \gotoBar "10"
    d, r r
    f r r
    f r r
  }
}

ViolaII = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    d4 r b
    c2 c4 \gotoBar "10"
    b4 r r
    d r r
    d r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    R2.*2 \gotoBar "10"
    R2.*3
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    R2.*2 \gotoBar "10"
    R2.*2
    f,4^\tutti b d
  }
}

AltoLyrics = \lyricmode {
  Ad te "cla -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    R2.*2 \gotoBar "10"
    R2.
    d,4^\tutti f b
    d2.
  }
}

TenoreLyrics = \lyricmode {
  Ad te cla --
  "ma -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    R2.*2 \gotoBar "10"
    b4^\tutti d f
    b2.~
    b
  }
}

BassoLyrics = \lyricmode {
  Ad te cla --
  "ma -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Allegro"
    b4-\solo r b
    f' a f \gotoBar "10"
    b,2-\tutti r4
    b r r
    b r r
  }
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }

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
  >>
}
