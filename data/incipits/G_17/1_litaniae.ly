\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Largo"
    R2.*10
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Largo"
    R2.*10
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    r4 a'^\solo c
    h2 a4
    g a f
    f8[ e] e4 g~
    g fis2
    g r4
    R2.*4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, e --
  lei -- son, e --
  lei --
  son,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    R2.*3
    g'4^\solo g d
    c2.
    d2 r4
    r r d~
    d cis a
    f'4. e8 d4
    r g e
  }
}

AltoLyrics = \lyricmode {
  Chri -- ste e --
  lei --
  son,
  Chri --
  ste ex --
  au -- di nos,
  Chri -- ste
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    R2.*4
    r4 a^\solo c
    h2 a4
    g a f
    f8[ e] e4 e'
    a, d4. c!8
    h4 h c~
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, e --
  lei -- son, Chri --
  ste au -- di
  nos, Chri -- ste
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    R2.*3
    c4^\solo c' h
    a2.
    g2 r4
    R2.*3
    g4 e a
  }
}

BassoLyrics = \lyricmode {
  Chri -- ste e --
  lei --
  son,

  Chri -- ste, "Chri -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Largo"
    a4-\solo c a
    d e f
    e c d
    c2 h4
    a2.
    g!4 g' f!
    e cis d
    a2 cis4
    d2 d4
    g e a
  }
}

BassFigures = \figuremode {
  r2.
  <6>4 <\t> <3>
  <6> q q
  <4> <3> <6>
  <7> <6\\>2
  r2.
  r
  <6 4>4 <5 _+>2
  r2.
  r4 <5>2
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
