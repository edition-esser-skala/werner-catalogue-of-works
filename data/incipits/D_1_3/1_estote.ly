\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \tempoMarkup "Allegro"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \tempoMarkup "Allegro"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \tempoMarkup "Allegro" \autoBeamOff
    R1*5
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \tempoMarkup "Allegro" \autoBeamOff
    R1*5
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    f2^\tutti f4 f
    f f,8 f' f4 f,
    r8 f'4 f8 d[ f16 es] d8[ c]
  }
}

TenoreLyrics = \lyricmode {
  E -- sto -- te
  for -- tes in bel -- lo,
  et pu -- "gna -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \tempoMarkup "Allegro" \autoBeamOff
    b'2^\tutti b4 b
    b b,8 b' b4 b,
    r8 b'4 b8 a[ c16 b] a8[ g]
    f[ a16 g] f8[ es] d[ f16 es] d8[ c]
    b4 d8 f b[ f b a]
  }
}

BassoLyrics = \lyricmode {
  E -- sto -- te
  for -- tes in bel -- lo,
  et pu -- gna -- _
  _ _ _ _
  te, et pu -- "gna -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \tempoMarkup "Allegro"
    b'2-! b4-! b-!
    b b,8 b' b4 b,
    r8 b'4 b8 a c16 b a8 g
    f a16 g f8 es d f16 es d8 c
    b4 d8 f b f b a %5
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <6>
  r1
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

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
