\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    f'2 b4
    a g2
    f r4
    r d e\trill
    f f, r
    r g a
    b b, r
    R2.*3
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    b'4 d4. es8
    f4 b, es~
    es d r
    r b a8 g
    c2 r4
    r es d8 c
    d4 g, r
    R2.*3
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*12
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    d2^\solo g4
    f es2\trill
    d r4
    R2.
    b2 d4
    c b2
    a4 c d
    es2.
    d4 d es
    f g d
    es4. f8 g4
    f c8[ d] es4
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve
  Re -- gi --
  na,

  sal -- ve
  Re -- gi --
  na, sal -- ve
  ma --
  ter, sal -- ve
  ma -- ter mi --
  se -- _ ri --
  cor -- di -- ae,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*12
  }
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*12
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    g4-\solo g'8 f es4
    d c g8 a
    b4 b'8 a g4
    d es2
    b4 b'2
    a4 g2
    f4 es! d
    c2.
    g4 g' f8 es
    d4 h2
    c4 c' b!
    a2 g4
  }
}

BassFigures = \figuremode {
  r2.
  r2 <6>4
  r2.
  <5>
  <4>4 <3>2
  r4 <5> <6!>
  r2.
  <5>2 <6>4
  r2.
  r2.
  r2 <6>4
  q2 q4
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
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
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
