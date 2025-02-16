\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Andante"
    R2.*3
    r4 r e'
    f e dis
    h' d, c
    f8 d \appoggiatura c h4.\trill a8
    a2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Andante"
    R2.*3
    r4 r e'
    f e dis
    h' d, c
    f8 d \appoggiatura c h4.\trill a8
    a2 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*8
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    r4 e2^\solo
    f4 e dis
    h' d, c
    f8[ d] \grace c h4. a8
    a2 r4
    R2.
    r4 r e'
    f e d
  }
}

AltoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um
  con -- fu -- gi --
  mus,

  sub
  tu -- um "prae -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*8
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Andante"
    a'8-\solo h c4 h
    a2 h8 a
    gis2 a4
    d, e e,
    a2 h4
    gis2 a4
    d e e,
    << { a' } \\ { a, } >> g'! f
  }
}

BassFigures = \figuremode {
  r2.
  <6!>4 <5> <_+>
  <6> <5>2
  r4 <4> <_+>
  <6!> <5> <_+>
  <6> <5>2
  r4 <4> <_+>
  <6> q q
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
