\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4^\solo f8[ d] cis[ e]
    d2 a'4
    b a4.\trill g8
    f[ a16 g] f8[ e] d4
    b'8 g e[ g] c,[ b']
    \tuplet 3/2 { a[ g f] } f4 r
  }
}

AltoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui
  ti -- _ met
  Do -- mi -- num:
  In man -- da -- tis
  e -- ius,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4-\solo d' a
    b a8 g f e
    d4 cis a
    d4. e8 f d
    g4 c! e,
    f a d,
  }
}

BassFigures = \figuremode {
  r2 <_+>4
  r2.
  <6>4 q2
  r2.
  r
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
