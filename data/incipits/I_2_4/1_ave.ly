\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
      \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
    R2.*6
    r8 h'4 cis8 d32( fis16.) h,32( d16.)
    cis32( e16.) a,32( cis16.) h32( d16.) cis32( e16.) d32( fis16.) h,32( d16.)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
      \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
    R2.*6
    r8 gis'4 a8 h32( d16.) gis,32( h16.)
    a32( cis16.) cis32( a16.) gis32( h16.) a32( cis16.) h32( d16.) gis,32( h16.)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    e8[^\solo a] \tuplet 3/2 4 { a[ h cis] h[ a gis] }
    a8.[\trill gis16] \tuplet 3/2 4 { a8[ h cis] h[ a gis] }
    a8.[\trill gis16] a4 cis~
    cis8[ h] h4. a8
    gis4 gis8 a h[ e]
    \tuplet 3/2 4 { cis[ h a] } \grace gis4 fis2
    e4 e'^\tutti h
    cis h8 r r4
  }
}

SopranoLyrics = \lyricmode {
  A -- ve __ Re --
  gi -- na __ coe --
  lo -- rum, a --
  ve __ _
  Do -- mi -- na An --
  ge -- lo --
  rum: Sal -- ve
  ra -- dix,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    cis4^\solo \tuplet 3/2 4 { cis8[ d e] d[ cis h] }
    cis8.[ h16] \tuplet 3/2 4 { cis8[ d e] d[ cis h] }
    cis8.[ h16] cis4 a'~
    a8[ gis] gis4 fis~
    fis8 e16[ dis] e4 e~
    e8 fis \grace e4 dis2\trill
    e4 gis^\tutti gis
    a gis8 r r4
  }
}

AltoLyrics = \lyricmode {
  A -- ve __ Re --
  gi -- na __ coe --
  lo -- rum, a --
  ve Do --
  mi -- na An --
  ge -- lo --
  rum: Sal -- ve
  ra -- dix,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
    r4 h^\tutti e
    e e8 r r4
  }
}

TenoreLyrics = \lyricmode {
  Sal -- ve
  ra -- dix,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
    r4 e^\tutti e
    a e8 r r4
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve
  ra -- dix,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4-\solo a, r8 e'
    a4 a, r8 e'
    a4. e8 cis a
    e'2 dis4
    e cis gis
    a h2
    e,4 e'2-\tutti
    a4 e8 r r e
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <6 4>4 <5 3> <6>8 <5>
  <9>4 <5 3>8 <6> <6>4
  <5>8 <6> <6 4>4 <5 _+>
  r2.
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
