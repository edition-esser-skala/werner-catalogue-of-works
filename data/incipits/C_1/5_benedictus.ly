\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r8 es-\solo g( es) d( f) \gotoBar "14"
    R2.
    g4. f16 es d es f8
    es4 r r
    R2.
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r8 g-\solo b( g) f( as) \gotoBar "14"
    R2.
    b4. as16 g f g as8
    g4 r r
    R2.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    b'8(\p es) b( g) f( as)
    g4 r r \gotoBar "14"
    es4 r r
    R2.*3
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'8(\p b) g( es) d( f)
    es4 r r \gotoBar "14"
    es4 r r
    R2.*3
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2 \gotoBar "14"
    b'4.^\solo es8 d16[ es f8]
    es[ d] es4 r
    b es8[ b] as g
    f[ es] f4 b
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne --
  di -- ctus,
  qui ve -- nit, qui
  ve -- nit, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2 \gotoBar "14"
    g'2^\solo f16([ g as8)]
    g[ f] g4 r
    g es8[ g] f es
    d[ c] d4 r
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  qui ve -- nit, qui
  ve -- nit,
}

Organo = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    es,4-\solo es' b
    es, es' b \gotoBar "14"
    es es' b
    es, es, b'
    es g as
    b b, d
  }
}

BassFigures = \figuremode {
  r2.
  r
  r2.
  r
  r2 <6>8 <5>
  r2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
