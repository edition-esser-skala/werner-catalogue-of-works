\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r8 a'' g( f) e( d)
    b'4 a8( g) f( e)
    f16( e) d8 d4 r
    R2.
    a'4. g16 f e( d) e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    r8 g'' f( e) d( cis)
    d a f4 r
    R2.
    f'4. e16 d c8. h16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    f'4.^\solo e8 d[ c!16 b]
    a8[ g] f4 e\trill
    d r r
    R2.
    f'4. e16[ d] c!8[ b16 a] %5
    g8[ f] b2\trill
    a4 r r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e __
  e -- lei -- _
  son,

  Chri -- _ ste __
  e -- lei --
  son,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4-\solo a' b
    f8 g a4 a,
    d d' b
    g a a,
    d d' a
    d, g c,!
    f, f'8 g a4
  }
}

BassFigures = \figuremode {
  r4 <6 _+>8 <5 \t>4.
  <6>4 <6 4> <5 _+>
  r2.
  r2 <6 4>8 <5 _+>
  r2 <6>4
  <7> q q
  r4. <6>16 <5> <5 _!>4
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
